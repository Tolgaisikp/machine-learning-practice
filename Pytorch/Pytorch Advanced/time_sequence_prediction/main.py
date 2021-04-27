import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np
import matplotlib.pyplot as plt

#generate sine wave
T = 20 #dalga genişliği
L = 1000 #her örneğin uzunluğu
N = 100 #örnek sayısı

x = np.empty((N, L), 'int64')
x[:] = np.array(range(L)) + np.random.randint(-4 * T, 4 * T, N).reshape(N, 1)
data = np.sin(x / 1.0 / T).astype('float64')
torch.save(data, open('traindata.pt', 'wb'))



class Sequence(nn.Module):
    def __init__(self, n_hidden = 51):
        super(Sequence, self).__init__()
        self.n_hidden = n_hidden
        self.lstm1 = nn.LSTMCell(1, self.n_hidden)
        self.lstm2 = nn.LSTMCell(self.n_hidden, self.n_hidden)
        self.linear = nn.Linear(self.n_hidden, 1)

    def forward(self, input, future = 0):
        outputs = []
        h_t = torch.zeros(input.size(0), 51, dtype=torch.double)
        c_t = torch.zeros(input.size(0), 51, dtype=torch.double)
        h_t2 = torch.zeros(input.size(0), 51, dtype=torch.double)
        c_t2 = torch.zeros(input.size(0), 51, dtype=torch.double)

        for input_t in input.split(1, dim=1):
            # N, 1
            h_t, c_t = self.lstm1(input_t, (h_t, c_t))
            h_t2, c_t2 = self.lstm2(h_t, (h_t2, c_t2))
            output = self.linear(h_t2)
            outputs.append(output)

        for i in range(future):  # if we should predict the future
            h_t, c_t = self.lstm1(output, (h_t, c_t))
            h_t2, c_t2 = self.lstm2(h_t, (h_t2, c_t2))
            output = self.linear(h_t2)
            outputs.append(output)

        outputs = torch.cat(outputs, dim=1)
        return outputs

if __name__ == '__main__':
    train_input = torch.from_numpy(data[3:, :-1])#97,999
    train_target = torch.from_numpy(data[3:, 1:])#97,999
    test_input = torch.from_numpy(data[:3, :-1])#3,999
    test_target = torch.from_numpy(data[:3, 1:])#3,999

    seq = Sequence()
    seq.double()
    criterion = nn.MSELoss()

    # Tüm verileri eğitmek için yükleyebildiğimiz için LBFGS'yi optimize edici olarak kullanın
    optimizer = optim.LBFGS(seq.parameters(), lr=0.8)

    n_steps = 10

    for i in range(n_steps):
        print('STEP: ', i)


        def closure():
            optimizer.zero_grad()
            out = seq(train_input)
            loss = criterion(out, train_target)
            print('loss:', loss.item())
            loss.backward()
            return loss


        optimizer.step(closure)

        # tahmin etmeye başlayın, burada gradyan izlemeye gerek yok
        with torch.no_grad():
            future = 1000
            pred = seq(test_input, future=future)
            loss = criterion(pred[:, :-future], test_target)
            print('test loss:', loss.item())
            y = pred.detach().numpy()

        # sonuçları yazdır
        plt.figure(figsize=(30, 10))
        plt.title('Predict future values for time sequences\n(Dashlines are predicted values)', fontsize=30)
        plt.xlabel('x', fontsize=20)
        plt.ylabel('y', fontsize=20)
        plt.xticks(fontsize=20)
        plt.yticks(fontsize=20)


        def draw(yi, color):
            plt.plot(np.arange(train_input.size(1)), yi[:train_input.size(1)], color, linewidth=2.0)
            plt.plot(np.arange(train_input.size(1), train_input.size(1) + future), yi[train_input.size(1):], color + ':', linewidth=2.0)


        draw(y[0], 'r')
        draw(y[1], 'g')
        draw(y[2], 'b')
        plt.savefig('predict%d.pdf' % i)
        plt.close()
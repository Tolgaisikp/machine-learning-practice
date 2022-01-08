import numpy as np
import math as m

def sigmoid(x):
    return 1 / (1 + m.exp(-x))

#tanımlamalar
P = np.array([(0, 0, 1, 1), (0, 1, 0, 1)], ).astype("float64")  # satir sutun
t = np.array([0, 1, 1, 0]).astype("float64")
mu = 0.5
alpha = 0.8
weightBar = np.array([(0.129, 0.57), (-0.927, -0.329)]).astype("float64")
weight = np.array([0.165, 0.753]).astype("float64")
biasBar = np.array([0.341, -0.115]).astype("float64")
bias = np.array([-0.99]).astype("float64")
deltaWeight11 = 0.0
deltaWeight12 = 0.0
deltaBarWeight11 = 0.0
deltaBarWeight12 = 0.0
deltaBarWeight21 = 0.0
deltaBarWeight22 = 0.0
deltaBias = 0.0
deltaBarBias1 = 0.0
deltaBarBias2 = 0.0

deger = int(input("Epouch sayısı giriniz:"))
#epouch döngüsü
for i in range(0,deger):
    print((i+1), ". Epouch")
    #iterasyon döngüsü
    for j in range(0,4):
        # opbarlar ve çıkış değeri
        op1Bar = sigmoid(P[:, j][0] * weightBar[0, 0] + P[:, j][1] * weightBar[0, 1] + biasBar[0])
        op2Bar = sigmoid(P[:, j][0] * weightBar[1, 0] + P[:, j][1] * weightBar[1, 1] + biasBar[1])
        op1 = sigmoid(op1Bar * weight[0] + op2Bar * weight[1] + bias)

        if t[j] != op1:

            # çıkış katmanı için hata ve delta hesaplama
            ep1 = (t[j] - op1) * op1 * (1 - op1)
            deltaWeight11 = mu * ep1 * op1Bar + deltaWeight11 * alpha
            deltaWeight12 = mu * ep1 * op2Bar + deltaWeight12 * alpha
            deltaBias = mu * ep1 + deltaBias * alpha

            # ara katmanı için hata ve delta hesaplama
            ep1Bar = ep1 * weight[0] * op1Bar * (1 - op1Bar)
            ep2Bar = ep1 * weight[1] * op2Bar * (1 - op2Bar)

            deltaBarWeight11 = mu * ep1Bar * P[:, j][0] + alpha * deltaBarWeight11
            deltaBarWeight12 = mu * ep1Bar * P[:, j][1] + alpha * deltaBarWeight12
            deltaBarWeight21 = mu * ep2Bar * P[:, j][0] + alpha * deltaBarWeight21
            deltaBarWeight22 = mu * ep2Bar * P[:, j][1] + alpha * deltaBarWeight22

            deltaBarBias1 = mu * ep1Bar + alpha * deltaBarBias1
            deltaBarBias2 = mu * ep2Bar + alpha * deltaBarBias2




            # çıkış katmanı için w-b değişim
            weight[0] = weight[0] + deltaWeight11
            weight[1] = weight[1] + deltaWeight12
            bias = bias + deltaBias

            # ara katmanı için w-b değişim
            weightBar[0, 0] = weightBar[0, 0] + deltaBarWeight11
            weightBar[0, 1] = weightBar[0, 1] + deltaBarWeight12
            weightBar[1, 0] = weightBar[1, 0] + deltaBarWeight21
            weightBar[1, 1] = weightBar[1, 1] + deltaBarWeight22
            biasBar[0] = biasBar[0] + deltaBarBias1
            biasBar[1] = biasBar[1] + deltaBarBias2

            print((j+1), ". İterasyon")
            print("******************")
            print("Bias Değeri")
            print(bias)
            print("------------------")
            print("Bias Bar Değerleri")
            print(biasBar)
            print("------------------")
            print("Ağırlık Değerleri")
            print(weight)
            print("------------------")
            print("Ağırlık Bar Değerleri")
            print(weightBar)
            print("******************")

        else:
            print("değişim yok")
            print("******************")

    print(op1)


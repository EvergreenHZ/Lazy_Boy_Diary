import numpy as np
import matplotlib.pyplot as plt

with open('./statistic') as f:
    lines = f.read().splitlines()
    ys = [float(y) for y in lines]
    xs = list(range(0, len(ys)))

    plt.scatter(xs, ys)
    plt.show()

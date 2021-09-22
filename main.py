import time

def heavy_task():
    for i in range(0, 100000):
        pass

def loop():
    while True:
        heavy_task()

def main():
    loop()

main()

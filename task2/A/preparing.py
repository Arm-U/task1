print('Hello, world!')

with open("index.h", "w") as ind:
    ind.write("""
    int foo2() {
        return 1;
    }
""")

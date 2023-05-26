//void add_arrays(int* ) {}

int main() {
    int a[3] = {17, 27, 37},
        b[3] = {44, 55, 66};
    int c[3];

    for (int i = 0; i < 3; i++) {
        c[i] = a[i] + b[i];
    }

    for (int i = 0; i < 3; i++) {
        println("%d", c[i]);
    }
}
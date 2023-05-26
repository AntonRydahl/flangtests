int main() {

    int first[6] = { 1, 2, 3, 4, 5, 6 },
        second[7];
    
    for (int i = 0; i < 6; i++) {
        second[i] = first[i];
    }
    second[6] = 7;

    for (int i = 0; i < 7; i++) {
        printf("%d", second[i]);
    }
}

/*integer :: first(6), second(7)

    first = [1, 2, 3, 4, 5, 6]
    second = [first, 7]*/
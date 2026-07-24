void func_020799dc(unsigned short *arr, unsigned int carry, int i, int count) {
    while (carry != 0 && i < count) {
        carry += arr[i];
        arr[i] = (unsigned short)carry;
        i++;
        carry = carry >> 16;
    }
}

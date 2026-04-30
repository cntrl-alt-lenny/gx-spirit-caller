/* func_020335b8: write 3 ints to fields at offsets 0xe8c/0xe90/0xe94. */
void func_020335b8(void *p, int a, int b, int c) {
    *(int *)((char *)p + 0xe8c) = a;
    *(int *)((char *)p + 0xe90) = b;
    *(int *)((char *)p + 0xe94) = c;
}

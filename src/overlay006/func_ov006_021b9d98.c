int func_ov006_021b9d98(void *a, void *b) {
    unsigned int range = *(unsigned int *)b;
    short high = (unsigned short)(range >> 16);
    short value = (unsigned short)*(unsigned int *)a;
    short low = (unsigned short)range;
    if (value > high)
        return 1;
    return -(value < low);
}

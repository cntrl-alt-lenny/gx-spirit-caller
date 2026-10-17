extern unsigned int data_021a1938[];

void func_0208226c(unsigned int a, int x, int y, int z)
{
    data_021a1938[a] = ((x >> 3) & 0x3ff) | (((y >> 3) & 0x3ff) << 10) | (((z >> 3) & 0x3ff) << 20) | (a << 30);
}

extern int data_021064a8[];

int func_ov002_022b03f4(int v)
{
    if (v <= 7)
        return 0;
    if (v >= 0x70)
        return 0;
    return !(((unsigned)data_021064a8[v / 32] >> (v % 32)) & 1);
}

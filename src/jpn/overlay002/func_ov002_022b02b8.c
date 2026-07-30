extern int data_021063c8[];

int func_ov002_022b02b8(int v)
{
    if (v <= 7)
        return 0;
    if (v >= 0x70)
        return 0;
    return !(((unsigned)data_021063c8[v / 32] >> (v % 32)) & 1);
}

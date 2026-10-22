int func_020b1854(double value)
{
    switch (((unsigned int *)&value)[1] & 0x7ff00000) {
    case 0x7ff00000:
        if ((((unsigned int *)&value)[1] & 0x000fffff) || ((unsigned int *)&value)[0]) return 1;
        return 2;
    case 0:
        if ((((unsigned int *)&value)[1] & 0x000fffff) || ((unsigned int *)&value)[0]) return 5;
        return 3;
    default:
        return 4;
    }
}

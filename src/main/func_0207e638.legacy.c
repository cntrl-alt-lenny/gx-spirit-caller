/* func_0207e638: bounds-checked stride lookup — return 0 if a1 >= o->f0(u16);
 * else o->f4 + a1*(o->f2&1 ? 16 : 8). Legacy 1.2/sp2p3 (predicated index). */
int func_0207e638(int *o, unsigned a1){
    if (a1 >= *(unsigned short *)o) return 0;
    if (*(unsigned short *)((char *)o + 2) & 1)
        return o[1] + (a1 << 4);
    return o[1] + (a1 << 3);
}

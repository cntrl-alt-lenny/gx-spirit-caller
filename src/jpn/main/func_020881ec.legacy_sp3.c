/* func_020881ec: if bit 0 of o->f24 is set, tail into func_020880c8(o). The
 * `(x<<31)>>31` extract is the signed 1-bit test. SP3 tier (sub sp,#4 prologue +
 * Style B `pop {pc}`) -> mwcc 1.2/sp3 (.legacy_sp3.c). */
extern void func_020880c8(void *);
void func_020881ec(int *o){
    if ((o[9] << 31) >> 31) func_020880c8(o);
}

/* func_ov012_021c9c80: unless the global "suppress" flag (bit 11 of the system
 * work word at +0x900) is set, kick off action 0x10 on o via func_ov000_021ab660.
 * (ov012_core.h) */
extern char *GetSystemWork(void);
extern void func_ov000_021ab660(void *, int);
void func_ov012_021c9c80(void *o) {
    if ((*(unsigned int *)(GetSystemWork() + 0x900) << 0x14) >> 0x1f)
        return;
    func_ov000_021ab660(o, 0x10);
}

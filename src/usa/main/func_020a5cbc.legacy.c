extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int CTRDG_IsOptionCartridge(void);
extern void OS_SetDPermissionsForProtectionRegion(int region, int perm);
extern int data_021a9854;

void func_020a5cbc(int param0) {
    int irqState = OS_DisableIrq();
    data_021a9854 = param0;
    if (!CTRDG_IsOptionCartridge()) {
        OS_SetDPermissionsForProtectionRegion(0xf000, param0 != 0 ? 0x1000 : 0x5000);
    }
    OS_RestoreIrq(irqState);
}

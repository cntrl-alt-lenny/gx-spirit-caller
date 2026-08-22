extern int func_0208df60(void);
extern int func_0208df0c(void);
extern int func_0208de94(void);
extern int func_0208ddec(void);
extern int Vram_GetBankBaseCD(void);
extern int Vram_GetBankBaseE(void);
extern int func_0208de4c(void);
extern int func_0208dd9c(void);

int func_ov010_021b2b08(int which) {
    switch (which) {
    case 0: return func_0208df60();
    case 1: return func_0208df0c();
    case 2: return func_0208de94();
    case 3: return func_0208ddec();
    case 4: return Vram_GetBankBaseCD();
    case 5: return Vram_GetBankBaseE();
    case 6: return func_0208de4c();
    case 7: return func_0208dd9c();
    default: return 0;
    }
}

typedef struct {
    int field0;
    char pad[12];
} Elem0219747c;

extern Elem0219747c data_0219739c[];
extern char data_02197354[];

int func_0202252c(int arg0) {
    char *base = data_02197354;
    if (data_0219739c[arg0].field0 < 0) {
        return 0;
    }
    *(int *)(base + (arg0 << 4) + 0x48) = -1;
    return 1;
}

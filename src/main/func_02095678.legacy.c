extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_02092904(void *, int);
extern void func_02093814(int);
extern int func_020953e4(void);
typedef struct Node { struct Node *next; } Node;
extern Node *func_0209591c(int);
extern int func_02096358(int, int, int);
extern Node *data_021a6754, *data_021a6758; extern int data_021a6764, data_021a6768, data_021a676c;
extern Node *data_021a6770[];
extern char data_021a6a20[];

int func_02095678(int flags) {
    int saved = OS_DisableIrq();
    if (data_021a6754 == 0) {
        OS_RestoreIrq(saved);
        return 1;
    }
    if (data_021a6768 >= 8) {
        if (!(flags & 1)) {
            OS_RestoreIrq(saved);
            return 0;
        }
        do { func_0209591c(1); } while (data_021a6768 >= 8);
    }
    func_02092904(data_021a6a20, 0x1800);
    if (func_02096358(7, (int)data_021a6754, 0) < 0) {
        if (!(flags & 1)) {
            OS_RestoreIrq(saved);
            return 0;
        }
        if (func_02096358(7, (int)data_021a6754, 0) < 0) {
            do {
                OS_RestoreIrq(saved);
                func_02093814(100);
                saved = OS_DisableIrq();
            } while (func_02096358(7, (int)data_021a6754, 0) < 0);
        }
    }
    if (flags & 2) func_020953e4();
    data_021a6770[data_021a6764] = data_021a6754; data_021a6764++; if (data_021a6764 > 8) data_021a6764 = 0;
    data_021a6754 = 0;
    data_021a6758 = 0;
    data_021a6768++;
    data_021a676c++;
    OS_RestoreIrq(saved);
    return 1;
}









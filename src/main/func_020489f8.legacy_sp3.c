typedef struct { char pad[12]; } Entry;
typedef struct { char pad[0x1d]; unsigned char changed; } State;
extern State *data_0219dc80;
extern void func_02048bc0(Entry *table, int index, int arg);
extern int func_0204918c(int index);
extern void func_02052df4(void *self, int a1);
extern void func_020535d4(int a0);
/* The original reads the return from this forwarding thunk. */
extern int func_02053644(void *p);
extern int func_02053650(int a0);
int func_020489f8(Entry *table, int count, int key) {
    int result = -1;
    int value, i, j;
    for (i = 0; i < count; i++) {
        value = func_0204918c(i);
        if (value != 0) {
            if (value == key) result = i;
            for (j = i + 1; j < count; j++) {
                if (value == func_0204918c(j)) {
                    if (func_02053644((void *)((int)table + i * 12)) == 2 && func_02053644(&table[j]) == 3)
                        func_02052df4(&table[i], value);
                    if (func_02053650((int)&table[j]) != 0)
                        func_020535d4((int)&table[i]);
                    func_02048bc0(table, j, i);
                    data_0219dc80->changed = 1;
                }
            }
        }
    }
    return result;
}



typedef struct {
    char pad0[0x30];
    int index;
    char pad1[4];
    void (*callback)(void *, int);
} State;

extern State data_02191f40;
extern int data_020c6390[];
extern char data_020c6488[];
extern char data_020c6490[];

void func_0201f138(int index) {
    if (data_02191f40.callback != 0) {
        data_02191f40.callback(data_020c6488, data_020c6390[data_02191f40.index]);
    }
    data_02191f40.index = index;
    if (data_02191f40.callback != 0) {
        data_02191f40.callback(data_020c6490, data_020c6390[index]);
    }
}

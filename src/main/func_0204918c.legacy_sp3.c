typedef struct {
    int key;
    int field_4;
    int source;
} Request;

typedef struct {
    char _pad[0x18];
    Request *requests;
} State;

extern State *data_0219dc80;
extern int func_02048108(void);
extern int func_02052f04(int context, Request *request);

int func_0204918c(int index) {
    Request *requests = data_0219dc80->requests;
    int result;
    if (requests == 0) return 0;
    result = func_02052f04(func_02048108(), &requests[index]);
    if (result != 0 && result != -1) return result;
    return 0;
}

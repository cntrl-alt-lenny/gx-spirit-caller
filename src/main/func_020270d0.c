/* E-13 stub for brief 198 permuter wave — clone of E-12 with
 * stride 224 (instead of 364) and ctx symbol data_0219a924.
 */

typedef struct {
    int first;
    unsigned char _pad[220];
} slot_t;

typedef struct {
    slot_t *array;
    int count;
} ctx_t;

extern ctx_t data_0219a924;
extern void Fill32(int value, void *dest, int size);

slot_t *func_020270d0(int x) {
    int count = data_0219a924.count;
    int i;
    for (i = 0; i < count; i++) {
        if (data_0219a924.array[i].first == 0) break;
    }
    if (i >= count) {
        return (void *)0;
    }
    {
        slot_t *result = &data_0219a924.array[i];
        Fill32(0, result, sizeof(slot_t));
        result->first = x;
        return result;
    }
}

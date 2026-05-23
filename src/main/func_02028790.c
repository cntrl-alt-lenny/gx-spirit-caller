/* E-14 stub for brief 198 permuter wave — clone of E-12 with
 * stride 412 and ctx symbol data_0219a92c.
 */

typedef struct {
    int first;
    unsigned char _pad[408];
} slot_t;

typedef struct {
    slot_t *array;
    int count;
} ctx_t;

extern ctx_t data_0219a92c;
extern void Fill32(int value, void *dest, int size);

slot_t *func_02028790(int x) {
    int count = data_0219a92c.count;
    int i;
    for (i = 0; i < count; i++) {
        if (data_0219a92c.array[i].first == 0) break;
    }
    if (i >= count) {
        return (void *)0;
    }
    {
        slot_t *result = &data_0219a92c.array[i];
        Fill32(0, result, sizeof(slot_t));
        result->first = x;
        return result;
    }
}

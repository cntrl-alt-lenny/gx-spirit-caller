struct Cache {
    char _pad0[4];
    int key[3];
    unsigned int recency[3];
};

extern void func_ov002_022ae2e0(struct Cache *arr, int idx, int target);

int func_ov002_022ae374(struct Cache *arr, int target) {
    int i, best;

    for (i = best = 0; i < 3; i++) {
        if (arr->key[i] == target) {
            arr->recency[i] = 0;
            return (i << 11) + 0x80 + 0x4000;
        }
    }

    for (i = 0; i < 3; i++) {
        if (arr->recency[i] > arr->recency[best]) {
            best = i;
        }
    }

    func_ov002_022ae2e0(arr, best, target);
    arr->key[best] = target;
    arr->recency[best] = 0;
    return (best << 11) + 0x80 + 0x4000;
}

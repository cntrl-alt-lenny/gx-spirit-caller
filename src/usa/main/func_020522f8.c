/* func_020522f8: `data->ptr + idx * 0x30` (slot pointer). */

extern char *data_0219e30c;
void *func_020522f8(int idx) {
    return data_0219e30c + idx * 0x30;
}

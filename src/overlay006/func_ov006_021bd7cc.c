/* func_ov006_021bd7cc: leaf, no callees (C-71). self->arr[idx] (stride
 * 0x24, base self+0xa0) has a signed counter pair f4/f8. Normalize f4 into
 * [threshold, 0) range: while negative, increment f4/decrement f8 (mark
 * result=1); if still below threshold, return early; otherwise decrement
 * f4/increment f8 until back under threshold, returning 1.
 * threshold = (self->f50==4) ? 3 : 4.
 */
typedef struct {
    unsigned char pad[4];
    int f4;
    int f8;
} Ov006Entry3630;

int func_ov006_021bd7cc(void *self_, int idx) {
    char *self = (char *)self_;
    Ov006Entry3630 *e = (Ov006Entry3630 *)(self + 0xa0 + idx * 0x24);
    int threshold = (*(int *)(self + 0x50) == 4) ? 3 : 4;
    int result = 0;

    if (e->f4 >= 0) goto after_norm;
    result = 1;
    if (e->f4 >= 0) goto after_norm;
    do {
        e->f4 += 1;
        e->f8 -= 1;
    } while (e->f4 < 0);
after_norm:

    if (e->f4 < threshold) goto return_result;
    result = 1;
    if (e->f4 < threshold) goto return_result;
    do {
        e->f4 -= 1;
        e->f8 += 1;
    } while (e->f4 >= threshold);

return_result:
    return result;
}

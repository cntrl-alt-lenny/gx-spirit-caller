/* func_02000d9c: if data_02105824+0x80 (a count) is 0, return 0. Else
 * pull the (count-1)th 16-byte record from data_02105824 into
 * data_02103fcc's 0x3c/0x40/0x44/0xb64 fields, then loop refreshing via
 * func_02000d4c while data_02103fcc+0xb64 + 1 lands on a stage
 * boundary (22/38/46/54/56), finally reporting whether it's past the
 * intro (>=4). */
extern char data_02105824[];
extern char data_02103fcc[];
extern int func_02000d4c(void);

int func_02000d9c(void)
{
    int count = *(int *)(data_02105824 + 0x80);
    char *rec;
    int v;

    if (count == 0) {
        return 0;
    }

    rec = data_02105824 + (count - 1) * 0x10;
    *(int *)(data_02103fcc + 0x3c) = *(int *)(rec + 4);
    *(int *)(data_02103fcc + 0x40) = *(int *)(rec + 8);
    *(int *)(data_02103fcc + 0x44) = *(int *)(rec + 0xc);
    *(int *)(data_02103fcc + 0xb64) = *(int *)(rec + 0x10) - 1;

    goto loop_test;
loop_body:
    *(int *)(data_02103fcc + 0xb64) = func_02000d4c() - 1;
    *(int *)(data_02103fcc + 0x3c) = 0;
    *(int *)(data_02103fcc + 0x40) = 0;
loop_test:
    v = *(int *)(data_02103fcc + 0xb64) + 1;
    if (v == 0x16 || v == 0x36 || v == 0x2e || v == 0x38 || v == 0x26) {
        goto loop_body;
    }

    return (v >= 4) ? 1 : 0;
}

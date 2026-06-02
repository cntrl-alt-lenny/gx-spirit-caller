/* func_ov006_021be8c4: ceiling-divide a sub-result by 60 (rows -> pages). */
extern int func_ov006_021be8ec(void);
int func_ov006_021be8c4(void) {
    return (func_ov006_021be8ec() + 59) / 60;
}

/* func_ov006_021be7b8: ceiling-divide a sub-result by 60 (rows -> pages). */
extern int func_ov006_021be7e0(void);
int func_ov006_021be7b8(void) {
    return (func_ov006_021be7e0() + 59) / 60;
}

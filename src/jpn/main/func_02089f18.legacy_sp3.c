/* func_02089f18: func_02089178 returns a Packed0203a5d4* (see
 * func_0203a584.c for the established bitfield type: low24 data +
 * hibyte tag byte, packed into one word). */

typedef struct {
    unsigned int low24 : 24;
    unsigned int hibyte : 8;
} Packed0203a5d4;

extern Packed0203a5d4 *func_02089178(int a0);
extern int func_02088f3c(int a0);
extern int func_02089bf0(int a0, int a1, int a2);
extern int func_02089d10(int a0, int a1, int a2);

int func_02089f18(int a0, unsigned int a1, int a2, int a3, int *a4) {
    Packed0203a5d4 *obj = func_02089178(a0);
    int result;

    if (obj == 0) {
        return 5;
    }

    if (a1 & 4) {
        if (obj->hibyte & 1) {
            result = func_02089bf0(obj->low24, a2, a3);
        } else {
            result = func_02089d10(obj->low24, a2, a3);
        }
        if (result == 0) {
            return 9;
        }
    } else {
        result = func_02088f3c(obj->low24);
    }

    if (a4 != 0) {
        *a4 = result;
    }
    return 0;
}

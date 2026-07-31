/* func_ov009_021acf1c: leaf state-code accessor. If +0x3c is set,
 * fail (0xff). Else dispatch on +0x38 (0-3): states 1-3 return an
 * error code (0xfe/0xfd/0xfc) if +0x34<=0 (or ==0 for state 1), else
 * +0x34 + (3-state)*3. State 0 dispatches +0x34 (0-3) to a small
 * fixed table. Any unrecognized state sets +0x3c and returns 0xff.
 */
int func_ov009_021acf1c(void *param0)
{
    if (*(int *)((char *)param0 + 0x3c) != 0) {
        return 0xff;
    }

    {
        int state = *(int *)((char *)param0 + 0x38);

        switch (state) {
        case 3: {
            int v34 = *(int *)((char *)param0 + 0x34);
            if (v34 > 0) {
                return v34 + (3 - state) * 3;
            }
            return 0xfe;
        }
        case 2: {
            int v34 = *(int *)((char *)param0 + 0x34);
            if (v34 > 0) {
                return v34 + (3 - state) * 3;
            }
            return 0xfd;
        }
        case 1: {
            int v34 = *(int *)((char *)param0 + 0x34);
            if (v34 == 0) {
                return 0xfc;
            }
            return v34 + (3 - state) * 3;
        }
        case 0: {
            int v34 = *(int *)((char *)param0 + 0x34);
            switch (v34) {
            case 0:
                return 0xfc;
            case 1:
                return 0;
            case 2:
                return 0xfa;
            case 3:
                return 0xfb;
            }
            goto baddefault;
        }
        }
    }

baddefault:
    *(int *)((char *)param0 + 0x3c) = 1;
    return 0xff;
}

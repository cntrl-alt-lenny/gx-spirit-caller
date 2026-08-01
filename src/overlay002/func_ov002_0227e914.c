/* func_ov002_0227e914 (ov002): switch(a) returning small constants.
 * Dense run 0x18a6..0x18a9 lowers to a jump table (addpl pc,pc,r,lsl#2);
 * sparse cases 0x18f9/0x194d/0x194e/0x197f use compare probes pivoted on
 * 0x194d. Leaf function, no push/pop. */
int func_ov002_0227e914(int a) {
    switch (a) {
    case 0x18a6: return 1;
    case 0x18a7: return 2;
    case 0x18a8: return 3;
    case 0x18a9: return 4;
    case 0x18f9: return 5;
    case 0x194d: return 6;
    case 0x194e: return 7;
    case 0x197f: return 8;
    }
    return 0;
}

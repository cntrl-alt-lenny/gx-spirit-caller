; func_0200093c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_0200093c
        .arm
func_0200093c:
    add ip, r1, r2
.L_02000940:
    cmp r1, ip
    stmltia r1!, {r0}
    blt .L_02000940
    bx lr

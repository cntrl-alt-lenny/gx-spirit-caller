; func_02034094 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .global func_02034094
        .arm
func_02034094:
    cmp r1, #0xc800
    blt .L_020340ac
    ldr r0, .L_020340b4
    cmp r1, r0
    movle r0, #0x1
    bxle lr
.L_020340ac:
    mov r0, #0x0
    bx lr
.L_020340b4:
        .word   0xc863

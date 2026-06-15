; func_020a08f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020928e8
        .extern func_0209dc30
        .extern func_0209dd30
        .extern func_0209de5c
        .global func_020a08f4
        .arm
func_020a08f4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_0209dc30
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    cmp r5, #0x3
    movhi r0, #0x6
    ldmhiia sp!, {r4, r5, r6, lr}
    bxhi lr
    cmp r5, #0x0
    beq .L_318
    cmp r4, #0x0
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    mov r0, r4
    mov r1, #0x50
    bl func_020928e8
.L_318:
    mov r1, r6
    mov r0, #0x14
    bl func_0209de5c
    mov r2, r5
    mov r3, r4
    mov r0, #0x14
    mov r1, #0x2
    bl func_0209dd30
    cmp r0, #0x0
    moveq r0, #0x2
    ldmia sp!, {r4, r5, r6, lr}
    bx lr

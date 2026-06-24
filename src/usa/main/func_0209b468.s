; func_0209b468 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209b468
        .arm
func_0209b468:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, #0x0
    mov r3, r5
    mov r2, r5
.L_14:
    mov r1, r0, lsr r2
    and r1, r1, #0xf
    cmp r1, #0xa
    addcs sp, sp, #0x4
    movcs r0, #0x0
    ldmcsia sp!, {r4, r5, lr}
    bxcs lr
    add r3, r3, #0x1
    cmp r3, #0x8
    add r2, r2, #0x4
    blt .L_14
    mov ip, #0x0
    mov lr, ip
    mov r4, #0x1
    mov r2, #0xa
.L_50:
    mov r1, r0, lsr lr
    and r3, r1, #0xf
    mul r1, r4, r2
    mla r5, r4, r3, r5
    add ip, ip, #0x1
    mov r4, r1
    cmp ip, #0x8
    add lr, lr, #0x4
    blt .L_50
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr

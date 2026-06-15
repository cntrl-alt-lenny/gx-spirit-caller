; func_02079984 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02079e20
        .extern func_020945f4
        .global func_02079984
        .arm
func_02079984:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r1
    mov r4, r3
    mov r7, r0
    mov r0, r6
    mov r1, r4
    mov r5, r2
    bl func_02079e20
    mov r3, #0x0
    mov ip, r3
    cmp r0, #0x0
    ble .L_ad0
.L_ab0:
    mov r2, ip, lsl #0x1
    ldrh r1, [r6, r2]
    add ip, ip, #0x1
    cmp ip, r0
    mla r1, r5, r1, r3
    strh r1, [r7, r2]
    mov r3, r1, lsr #0x10
    blt .L_ab0
.L_ad0:
    cmp ip, r4
    movlt r0, ip, lsl #0x1
    addlt ip, ip, #0x1
    sub r1, r4, ip
    strlth r3, [r7, r0]
    mov r2, r1, lsl #0x1
    add r0, r7, ip, lsl #0x1
    mov r1, #0x0
    bl func_020945f4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr

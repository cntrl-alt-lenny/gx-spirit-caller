; func_02088dfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_021a516c
        .extern func_02088880
        .extern func_02088dc0
        .extern func_0209281c
        .global func_02088dfc
        .arm
func_02088dfc:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x2c
    mov r5, r0
    mov r4, r1
    mov r7, r2
    mov r6, r3
    bl func_02088dc0
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r1, r5
    mov r2, r4
    mov r0, #0x0
    bl Fill32
    mov r0, r5
    mov r1, r4
    bl func_0209281c
    str r7, [sp]
    mov r2, #0x0
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    str r6, [sp, #0x10]
    mov r1, #0x7f
    str r1, [sp, #0x14]
    str r2, [sp, #0x18]
    ldr r2, [sp, #0x40]
    str r1, [sp, #0x1c]
    ldr r1, [sp, #0x44]
    str r2, [sp, #0x20]
    ldr ip, [sp, #0x48]
    str r1, [sp, #0x24]
    mov r1, r5
    mov r3, r4, lsr #0x1
    add r2, r5, r4, lsr #0x1
    str ip, [sp, #0x28]
    bl func_02088880
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021a516c

; func_0200b580 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .global func_0200b580
        .arm
func_0200b580:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x18
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    movs r4, r0
    beq .L_288
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x18
    bl Fill32
    ldr r0, [r5, #0x18]
    str r0, [r4]
    ldr r0, [r5, #0x20]
    add r0, r5, r0
    str r0, [r4, #0x4]
    ldr r0, [r5, #0x28]
    add r0, r5, r0
    str r0, [r4, #0x8]
    ldr r0, [r5, #0x30]
    add r0, r5, r0
    str r0, [r4, #0xc]
    ldr r0, [r5, #0x34]
    str r0, [r4, #0x10]
    ldr r0, [r5, #0x38]
    add r0, r5, r0
    str r0, [r4, #0x14]
.L_288:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}

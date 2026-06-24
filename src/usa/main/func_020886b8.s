; func_020886b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_021a516c
        .extern func_0209281c
        .extern func_02094fac
        .global func_020886b8
        .arm
func_020886b8:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    ldr r0, [r4]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, #0x0
    str r0, [r4, #0x1c]
    ldr r1, [r4, #0xc]
    ldr r2, [r4, #0x14]
    bl Fill32
    ldr r1, [r4, #0x10]
    ldr r2, [r4, #0x14]
    mov r0, #0x0
    bl Fill32
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x14]
    bl func_0209281c
    ldr r0, [r4, #0x10]
    ldr r1, [r4, #0x14]
    bl func_0209281c
    ldr r1, [r4, #0x2c]
    mov r3, #0x0
    cmp r1, #0x0
    movge r0, #0x1
    movge r2, r0, lsl r1
    ldr r0, [r4, #0x24]
    ldr r1, [r4, #0x28]
    movlt r2, #0x0
    bl func_02094fac
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a516c

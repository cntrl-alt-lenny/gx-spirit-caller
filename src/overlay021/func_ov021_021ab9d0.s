; func_ov021_021ab9d0 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02021660
        .extern func_020216b0
        .extern func_020216bc
        .global func_ov021_021ab9d0
        .arm
func_ov021_021ab9d0:
    stmdb sp!, {r4, lr}
    ldr r2, [r0, #0x48]
    ldr r1, [r0, #0x44]
    add r2, r2, #0x1
    add r2, r2, r2, lsl #0x2
    add r2, r2, r1
    ldr r0, [r0]
    mov r1, #0x3
    bl func_02021660
    mov r4, r0
    mov r1, #0x0
    bl func_020216bc
    orr r2, r0, #0x82
    mov r0, r4
    mov r1, #0x0
    bl func_020216b0
    mov r0, #0x1
    ldmia sp!, {r4, pc}

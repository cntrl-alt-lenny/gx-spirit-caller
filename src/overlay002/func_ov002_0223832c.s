; func_ov002_0223832c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d8904
        .extern func_ov002_021de134
        .global func_ov002_0223832c
        .arm
func_ov002_0223832c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    mov r3, r0, lsl #0x16
    mov r1, r0, lsl #0x12
    mov r2, r0, lsl #0x17
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1c
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8904
    ldr r1, [r4, #0x14]
    mov r2, #0x1
    mov r0, r1, lsl #0x16
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x4
    add r0, r0, r1, lsr #0x1c
    mov r1, r2, lsl r0
    mov r0, r4
    mov r2, #0xb
    mov r3, #0x8
    bl func_ov002_021de134
    mov r0, #0x0
    ldmia sp!, {r4, pc}

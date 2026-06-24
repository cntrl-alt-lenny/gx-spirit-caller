; func_0203e820 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203e204
        .global func_0203e820
        .arm
func_0203e820:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    strb r0, [r4, #0xd15]
    ldrb r2, [r4, #0xd0b]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x1c
    add r1, r1, #0x1
    and r1, r1, #0xff
    bic r2, r2, #0xf0
    and r1, r1, #0xf
    orr r1, r2, r1, lsl #0x4
    strb r1, [r4, #0xd0b]
    bl func_0203e204
    mov r0, #0x1
    strb r0, [r4, #0xd11]
    mov r0, #0x3
    ldmia sp!, {r4, pc}

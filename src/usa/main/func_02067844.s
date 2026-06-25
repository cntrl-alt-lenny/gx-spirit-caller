; func_02067844 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02067844
        .arm
func_02067844:
    stmdb sp!, {r4, lr}
    ldrb r4, [r0, #0x100]
    add r2, r4, #0x1
    strb r2, [r0, #0x100]
    ldrb r3, [r0, #0x101]
    ldrb r2, [r0, r4]
    add r2, r3, r2
    strb r2, [r0, #0x101]
    ldrb r3, [r0, #0x104]
    ldrb r2, [r0, #0x101]
    ldrb r4, [r0, r3]
    ldrb r2, [r0, r2]
    strb r2, [r0, r3]
    ldrb r3, [r0, #0x103]
    ldrb r2, [r0, #0x101]
    ldrb r3, [r0, r3]
    strb r3, [r0, r2]
    ldrb r3, [r0, #0x100]
    ldrb r2, [r0, #0x103]
    ldrb r3, [r0, r3]
    strb r3, [r0, r2]
    ldrb r2, [r0, #0x100]
    strb r4, [r0, r2]
    ldrb r3, [r0, #0x102]
    ldrb r2, [r0, r4]
    add r2, r3, r2
    strb r2, [r0, #0x102]
    ldrb r3, [r0, #0x103]
    ldrb r2, [r0, #0x104]
    ldrb ip, [r0, #0x101]
    ldrb r4, [r0, #0x102]
    ldrb lr, [r0, #0x100]
    ldrb r3, [r0, r3]
    ldrb r2, [r0, r2]
    ldrb ip, [r0, ip]
    ldrb r4, [r0, r4]
    add r2, r3, r2
    ldrb r3, [r0, lr]
    add r2, ip, r2
    and r2, r2, #0xff
    add r3, r4, r3
    ldrb r2, [r0, r2]
    and r3, r3, #0xff
    ldrb r3, [r0, r3]
    ldrb r2, [r0, r2]
    eor r3, r1, r3
    eor r2, r3, r2
    strb r2, [r0, #0x103]
    strb r1, [r0, #0x104]
    ldrb r0, [r0, #0x103]
    ldmia sp!, {r4, pc}

; func_0203671c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020385bc
        .global func_0203671c
        .arm
func_0203671c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r0, #0x0
    str r0, [r5, #0x38]
    mov r6, r1
    str r0, [r5]
    add r0, r5, #0x40
    mov r1, #0x7f
    mov r4, r2
    bl func_020385bc
    str r6, [r5, #0x34]
    strh r4, [r5, #0x74]
    ldrh r0, [r5, #0x68]
    mov r4, #0x4000
    mov r1, #0x0
    tst r0, #0x2000
    bicne r0, r0, #0x2000
    orrne r4, r4, r0
    moveq r0, #0x0
    streq r0, [r5, #0x5c]
    strb r1, [r5, #0x72]
    strh r1, [r5, #0x58]
    sub r0, r1, #0x1
    strh r0, [r5, #0x22]
    strh r1, [r5, #0x1c]
    strh r1, [r5, #0x18]
    mov r2, #0x40
    strh r1, [r5, #0x1a]
    strb r2, [r5, #0x25]
    add r0, r5, #0xc
    strb r2, [r5, #0x24]
    bl func_020385bc
    mov r1, #0x0
    strb r1, [r5, #0x2a]
    mov r0, #0x7f
    strb r1, [r5, #0x29]
    strb r0, [r5, #0x28]
    strb r0, [r5, #0x27]
    strb r0, [r5, #0x26]
    str r1, [r5, #0x8]
    strb r1, [r5, #0x20]
    strb r1, [r5, #0x21]
    mov r0, #0x1
    strh r0, [r5, #0x1e]
    strb r1, [r5, #0x2b]
    strb r1, [r5, #0x73]
    strh r4, [r5, #0x68]
    ldmia sp!, {r4, r5, r6, pc}

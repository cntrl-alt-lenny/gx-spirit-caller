; func_0203eac4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c8b0
        .global func_0203eac4
        .arm
func_0203eac4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x10
    bl func_0203c8b0
    add r0, r0, #0xd00
    cmp r4, #0xd
    movhi r4, #0xd
    ldrh r3, [r0, #0x16]
    sub r1, r4, #0x1
    mov r2, #0x1
    orr r1, r3, r2, lsl r1
    strh r1, [r0, #0x16]
    ldmia sp!, {r4, pc}

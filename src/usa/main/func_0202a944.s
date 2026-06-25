; func_0202a944 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208c79c
        .global func_0202a944
        .arm
func_0202a944:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    mov r1, #0x0
    bl func_0208c79c
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_0208c79c
    mov r1, #0x4000000
    ldr r0, [r1]
    add r2, r1, #0x1000
    bic r0, r0, #0xe000
    str r0, [r1]
    ldr r0, [r2]
    ldr ip, _LIT2
    bic r0, r0, #0xe000
    str r0, [r2]
    ldrh r3, [r1, #0x48]
    mov r2, #0x0
    mov r0, #0x1
    bic r3, r3, #0x3f
    orr r3, r3, #0x20
    strh r3, [r1, #0x48]
    ldrh r3, [r1, #0x48]
    bic r3, r3, #0x3f00
    orr r3, r3, #0x2000
    strh r3, [r1, #0x48]
    ldrh r3, [r1, #0x4a]
    bic r3, r3, #0x3f
    orr r3, r3, #0x20
    strh r3, [r1, #0x4a]
    ldrh r3, [ip]
    bic r3, r3, #0x3f
    orr r3, r3, #0x20
    strh r3, [ip]
    ldrh r3, [ip]
    bic r3, r3, #0x3f00
    orr r3, r3, #0x2000
    strh r3, [ip]
    ldrh r3, [ip, #0x2]
    bic r3, r3, #0x3f
    orr r3, r3, #0x20
    strh r3, [ip, #0x2]
    strh r2, [r1, #0x50]
    strh r2, [ip, #0x8]
    ldmia sp!, {r3, pc}
_LIT0: .word 0x0400006c
_LIT1: .word 0x0400106c
_LIT2: .word 0x04001048

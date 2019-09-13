//
//  2_AddTwoNumbers.swift
//  LeetCodeSrc
//
//  Created by 王曦 on 2019/9/13.
//  Copyright © 2019 WesternTimes. All rights reserved.
//

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        var text = "ListNode:"
        var p: ListNode? = self
        
        repeat {
            text += "\(p?.val ?? 0)"
            p = p?.next
            
            if p != nil {
                text += " -> "
            }
        } while p != nil
        return text
    }
}

func List(_ array: [Int]) -> ListNode? {
    if array.count == 0 {
        return nil
    }
    
    let list: ListNode? = ListNode(array[0]);
    var p = list
    
    for idx in 1..<array.count {
        p?.next = ListNode(array[idx])
        p = p?.next;
    }
    return list
}

let l1 = List([2, 4, 3])
let l2 = List([5, 6, 4])

protocol Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode?
}

class Solution1: Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var p1 = l1, p2 = l2
        let result: ListNode? = ListNode(0)
        
        var pr = result
        var carry = 0
        
        while p1 != nil || p2 != nil {
            
            var sum = (p1?.val ?? 0) + (p2?.val ?? 0) + carry
            
            if sum < 10 {
                carry = 0
            } else {
                sum -= 10
                carry = 1
            }
            
            pr?.val = sum
            pr?.next = ListNode(0)
            pr = pr?.next
            
            p1 = p1?.next
            p2 = p2?.next
        }
        
        pr = result
        while pr?.next?.next != nil {
            pr = pr?.next
        }
        
        if carry == 1 {
            pr?.next?.val = carry
        } else {
            pr?.next = nil
        }
        
        return result
    }
}

class Solution2: Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var p1: ListNode? = l1
        var p2: ListNode? = l2
        
        let result = ListNode(0)
        var p = result
        var carry = 0
        
        while p1 != nil || p2 != nil {
            
            let sum = (p1?.val ?? 0) + (p2?.val ?? 0) + carry
            carry = sum/10
            
            p.next = ListNode(sum%10)
            p = p.next!
            
            p1 = p1?.next
            p2 = p2?.next
        }
        
        if carry > 0 {
            p.next = ListNode(carry)
        }
        
        return result.next
    }
}

//print("l1: ", l1!)
//print("l2: ", l2!)
//
////let result = Solution().addTwoNumbers(l1, l2)
////let result = Solution().addTwoNumbers(List([1, 8]),List([0]))
//let result = Solution().addTwoNumbers(List([5]),List([5]))
//print("result: ", result ?? "error")

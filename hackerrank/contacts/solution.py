def char_index(char):
    return ord(char) - ord('a')            

class TrieNode:
    LENGTH = 26
    def __init__(self, data=None):
        self.data = data
        self.children = [None] * 26
        self.count = 1
            
class Trie:
    def __init__(self):
        self.root = TrieNode()
    
    def add(self, word):
        current = self.root
        for ch in word:
            if current.children[char_index(ch)] is None:
                current.children[char_index(ch)] = TrieNode(data=ch)
            else:
                current.children[char_index(ch)].count += 1
            current = current.children[char_index(ch)]

    def count(self, keyword):
        current = self.root
        for ch in keyword:
            current = current.children[char_index(ch)]
            if current is None:
                return 0
        return current.count
    
if __name__ == "__main__":
    with open("input-01.txt") as f:
        n_line = int(f.readline())
        trie = Trie()
        for _ in range(n_line):
            type_, word_ = f.readline().strip().split(" ")
            if type_ == "add":
                trie.add(word_)
            else:
                print(trie.count(word_))
    

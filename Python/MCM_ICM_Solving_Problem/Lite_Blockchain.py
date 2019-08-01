#This file to show the results of the blockchain_results.
#And in order to show basic rule of blockchain_working.
#Class of Blockchain:
#-*- coding: utf-8 -*-
import hashlib as hasher
import datetime as date

class Blockchain:
    def __init__(self, index, timestamp, data, previous_hash):
        self.index = index
        self.timestamp = timestamp
        self.data = data
        self.previous_hash = previous_hash
        self.hash = self.hash_blockchain()
    def hash_blockchain(self):
        sha_1 = hasher.sha256()
        sha_1.update(str(self.index).encode('utf-8') +
            str(self.timestamp).encode('utf-8') +
            str(self.data).encode('utf-8') +
            str(self.previous_hash).encode('utf-8'))
        return sha_1.hexdigest()
def create_genesis_block():
    # Manually construct a block with
    # index zero and arbitrary previous hash
    return Blockchain(0, date.datetime.now(), "Genesis Block", "0")

def next_block(last_block):
    this_index = last_block.index + 1
    this_timestamp = date.datetime.now()
    this_data = "Hey! I'm block " + str(this_index)
    this_hash = last_block.hash
    return Blockchain(this_index, this_timestamp, this_data, this_hash)
# Create the blockchain and add the genesis block
blockchain = [create_genesis_block()]
previous_block = blockchain[0]
# How many blocks should we add to the chain
# after the genesis block
num_of_blocks_to_add = 20
# Add blocks to the chain
for i in range(0, num_of_blocks_to_add):
    block_to_add = next_block(previous_block)
    blockchain.append(block_to_add)
    previous_block = block_to_add
    # Output.
    print ("Block #{} has been added to the blockchain!".format(block_to_add.index))
    print ("Hash: {}\n".format(block_to_add.hash))

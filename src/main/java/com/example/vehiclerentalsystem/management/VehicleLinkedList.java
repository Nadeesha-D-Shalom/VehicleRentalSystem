package com.example.vehiclerentalsystem.management;

import com.example.vehiclerentalsystem.classes.Vehicle;
import com.example.vehiclerentalsystem.classes.VehicleNode;

import java.util.function.Consumer;

public class VehicleLinkedList {
    private VehicleNode head;

    public synchronized void addVehicle(Vehicle vehicle) {
        if (vehicle == null) throw new IllegalArgumentException("Vehicle cannot be null");

        VehicleNode newNode = new VehicleNode(vehicle);
        if (head == null) {
            head = newNode;
        } else {
            VehicleNode current = head;
            while (current.getNext() != null) {
                current = current.getNext();
            }
            current.setNext(newNode);
        }
    }

    public void forEach(Consumer<Vehicle> action) {
        if (action == null) throw new IllegalArgumentException("Action cannot be null");

        VehicleNode current = head;
        while (current != null) {
            action.accept(current.getVehicle());
            current = current.getNext();
        }
    }

    public void clear() {
        head = null;
    }

    public boolean isEmpty() {
        return head == null;
    }

    protected VehicleNode getHead() {
        return head;
    }

    public void selectionSortByRentPrice() {
        VehicleNode current = head;

        while (current != null) {
            VehicleNode minNode = current;
            VehicleNode next = current.getNext();

            while (next != null) {
                if (next.getVehicle().getPrice() < minNode.getVehicle().getPrice()) {
                    minNode = next;
                }
                next = next.getNext();
            }

            if (minNode != current) {
                Vehicle temp = current.getVehicle();
                current.setVehicle(minNode.getVehicle());
                minNode.setVehicle(temp);
            }

            current = current.getNext();
        }
    }

    public void selectionSortByAvailability() {
        VehicleNode current = head;

        while (current != null) {
            VehicleNode minNode = current;
            VehicleNode next = current.getNext();

            while (next != null) {
                if (next.getVehicle().getAvailability().compareToIgnoreCase(minNode.getVehicle().getAvailability()) < 0) {
                    minNode = next;
                }
                next = next.getNext();
            }

            if (minNode != current) {
                Vehicle temp = current.getVehicle();
                current.setVehicle(minNode.getVehicle());
                minNode.setVehicle(temp);
            }

            current = current.getNext();
        }
    }
}

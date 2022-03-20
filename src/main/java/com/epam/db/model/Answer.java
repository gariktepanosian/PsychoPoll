package com.epam.db.model;


public class Answer {

    private long id;

    private String text;

    private long question_id;

    private long weight;

    public Answer(long id, String text, long weight, long question_id) {
        this.id = id;
        this.text = text;
        this.weight = weight;
        this.question_id = question_id;
    }

    public Answer() {
    }

    public long getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(long question_id) {
        this.question_id = question_id;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public long getWeight() {
        return weight;
    }

    public void setWeight(long weight) {
        this.weight = weight;
    }

    @Override
    public String toString() {
        return "Answer{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", weight=" + weight +
                '}';
    }
}

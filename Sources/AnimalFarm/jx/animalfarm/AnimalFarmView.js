require(jxswiftui).import();

exports.AnimalListView = class extends View {
    constructor(model) {
        super();
        this.observed.model = model;
    }

    body() {
        const model = this.observed.model;
        return VStack([
            List([
                ForEach(model.pets, (pet) => {
                    return pet.id;
                }, (pet) => {
                    return NavigationLink(() => {
                        return new PetDetailView(pet)
                    }, new PetRow(pet, () => {
                        withAnimation(() => model.sellPet(pet.id));
                    }))
                })
            ]),
            Button("New Animal", () => { withAnimation(() => model.addPet()) }),
        ])
    }
}

class PetRow extends View {
    constructor(pet, sellAction) {
        super();
        this.pet = pet;
        this.sellAction = sellAction;
    }

    body() {
        return HStack([
            new animalfarm.AnimalView(this.pet),
            Spacer(),
            Text('Sell')
                .onTapGesture(() => {
                    this.sellAction();
                })
        ])
    }
}

class PetDetailView extends View {
    constructor(pet) {
        super();
        this.pet = pet;
        this.state.sliderValue = 0.0
    }

    body() {
        return Form([
            Section('Inventory info', [
                Text(this.pet.animal),
                Text("$" + this.pet.price)
                    .font(Font.title.monospaced().bold())
                    .foregroundColor(Color.blue)
                    .background(Color.purple)
            ]),
            Section('Animal info', [
                Text('Slider value: ' + this.state.sliderValue),
                Slider(this.state.$sliderValue)
            ])
        ])
        .navigationTitle('Animal')
    }
}
